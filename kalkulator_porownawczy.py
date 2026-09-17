import json, re
from collections import defaultdict

BASE = "."

CANONICAL = [
    "Name Calling or Labelling", "Guilt by Association", "Casting Doubt",
    "Appeal to Hypocrisy", "Questioning the Reputation", "Flag Waving",
    "Appeal to Authority", "Appeal to Popularity", "Appeal to Values",
    "Appeal to Fear, Prejudice", "Strawman", "Red Herring", "Whataboutism",
    "Causal Oversimplification", "False Dilemma or No Choice",
    "Consequential Oversimplification", "Slogans", "Conversation Killer",
    "Appeal to Time", "Loaded Language",
    "Obfuscation, Intentional Vagueness, Confusion",
    "Exaggeration or Minimisation", "Repetition", "Appeal to Pity",
    "False Equivalence",
]

ALIASES = {
    "Name Calling": "Name Calling or Labelling",
    "Appeal to Fear": "Appeal to Fear, Prejudice",
    "Appeal to Fear, Prejudice": "Appeal to Fear, Prejudice",
}

ALL_KNOWN = sorted(set(CANONICAL) | set(ALIASES), key=len, reverse=True)
PATTERN = re.compile("|".join(re.escape(x) for x in ALL_KNOWN))

def extract_labels(raw):
    if raw.strip().lower() == "brak":
        return set()
    found = set()
    for m in PATTERN.finditer(raw):
        label = m.group(0)
        found.add(ALIASES.get(label, label))
    return found

human = {}
data = json.load(open(f"{BASE}/annotations/anotacja_reczna.json", encoding="utf-8"))
label_fields = ["attack_on_reputation", "justification", "simplification", "distraction",
                "call", "manipulative_wording", "new_2025"]
for task in data:
    pid = task["data"]["id"]
    labels = set()
    ann = task["annotations"][0]
    for r in ann["result"]:
        if r["from_name"] in label_fields:
            for choice in r["value"]["choices"]:
                labels.add(ALIASES.get(choice, choice))
    human[pid] = labels

print("=== WYNIK LUDZKI ===")
for pid in sorted(human):
    print(f"  {pid}: {sorted(human[pid]) if human[pid] else '(brak technik)'}")

model_files = {
    "ChatGPT": "wyniki_chatgpt_5_6_luna.md",
    "Gemini": "wyniki_gemini_flash_3_6.md",
    "DeepSeek": "wyniki_deepseek_r1.md",
    "Kimi": "wyniki_kimi_k2_6_instant.md",
}
models = {}
for name, fname in model_files.items():
    path = f"{BASE}/llm_results/{fname}"
    text = open(path, encoding="utf-8").read()
    preds = {}
    for m in re.finditer(r"### (P\d+)\s*\nTECHNIKI:\s*(.*)", text):
        pid = m.group(1)
        preds[pid] = extract_labels(m.group(2))
    models[name] = preds

print("\n=== PORÓWNANIE Z MODELAMI ===")
for name, preds in models.items():
    tp = fp = fn = 0
    for pid in human:
        h, p = human[pid], preds.get(pid, set())
        tp += len(h & p); fp += len(p - h); fn += len(h - p)
  
    precision = tp / (tp + fp) if (tp + fp) else float("nan")
    recall = tp / (tp + fn) if (tp + fn) else float("nan")
    f1 = 2 * precision * recall / (precision + recall) if (precision + recall) else float("nan")
    print(f"  {name:10s} True Positive={tp:3d} | False Positive={fp:3d} | False Negative={fn:3d} | precision={precision:.3f} | recall={recall:.3f} | F1={f1:.3f}")
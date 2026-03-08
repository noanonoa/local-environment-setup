# vim-help

Explain how to achieve the requested vim operation.

## Arguments

$ARGUMENTS = the vim topic or operation the user wants to learn

## Instructions

For the topic "$ARGUMENTS", provide a visually clear, memorable reference:

---

## ⌨️ The Command(s)

Show the keystroke sequence(s) or command(s) needed.

**For keystrokes** — display with spaces between keys for readability:
```
v  i  w
```

**For Ex commands** — show the full command:
```
:%s/search/replace/gc
```

If multiple approaches exist, use a comparison table:

| Keystrokes | What You Get |
|:----------:|:-------------|
| `v i w` | 📦 inner word (no surrounding spaces) |
| `v a w` | 📦 a word (includes trailing space) |
| `v w` | ➡️ cursor to next word start |

---

## 🔍 Breakdown

Deconstruct EACH component of the sequence:

```
┌─────┬────────────────────────────────┐
│ v   │ enter VISUAL mode              │
├─────┼────────────────────────────────┤
│ i   │ "inner" — text object modifier │
├─────┼────────────────────────────────┤
│ w   │ word — the text object         │
└─────┴────────────────────────────────┘
```

For Ex commands:
```
┌─────┬─────────────────────────────────┐
│ :   │ enter command-line mode         │
├─────┼─────────────────────────────────┤
│ %s  │ substitute on ALL lines         │
├─────┼─────────────────────────────────┤
│ /   │ delimiter between parts         │
├─────┼─────────────────────────────────┤
│ g   │ global — all matches on line    │
├─────┼─────────────────────────────────┤
│ c   │ confirm — ask before each       │
└─────┴─────────────────────────────────┘
```

When relevant, tag the mode: `[NORMAL]` `[VISUAL]` `[INSERT]` `[COMMAND]`

---

## 🎯 Try It

Provide 2-3 concrete scenarios to practice:

**Scenario 1:** [Real situation]
```vim
keystrokes or command here
```
→ Result: [what happens]

**Scenario 2:** [Another situation]
```vim
keystrokes or command here
```
→ Result: [what happens]

---

## 💪 Muscle Memory Drill

A progressive sequence to build the habit:

```
1. 🟢 Easy    →  [simplest form]
2. 🟡 Medium  →  [add one element]
3. 🔴 Full    →  [complete command]
```

Suggest a small file or text to practice on if helpful.

---

## 🔗 Related

List 1-2 related commands in the same family:

| Command | What It Does |
|:-------:|:-------------|
| `...` | ... |
| `...` | ... |

---

## Response Style

- Use the visual formatting above (tables, boxes, emojis)
- Keep text tight — let the structure do the talking
- Make it something worth bookmarking
- Focus on building intuition, not just memorization

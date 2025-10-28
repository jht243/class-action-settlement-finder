# Golden Prompt Set - Class Action Finder

This document contains test prompts to validate the Class Action Finder connector's metadata and behavior.

## Purpose
Use these prompts to test:
- **Precision**: Does the right tool get called?
- **Recall**: Does the tool get called when it should?
- **Accuracy**: Are the right parameters passed?

---

## Direct Prompts (Should ALWAYS trigger the connector)

### 1. Explicit Tool Name
**Prompt**: "Show me class action settlements"
**Expected**: ✅ Calls `find-settlements` with no category filter
**Status**: [ ] Pass / [ ] Fail

### 2. Settlement Discovery
**Prompt**: "Find class action lawsuits I can join"
**Expected**: ✅ Calls `find-settlements` with no category filter
**Status**: [ ] Pass / [ ] Fail

### 3. Eligibility Check
**Prompt**: "What class actions am I eligible for?"
**Expected**: ✅ Calls `find-settlements` with no category filter
**Status**: [ ] Pass / [ ] Fail

### 4. Settlement Browsing
**Prompt**: "Browse available class action settlements"
**Expected**: ✅ Calls `find-settlements` with no category filter
**Status**: [ ] Pass / [ ] Fail

### 5. Category-Specific
**Prompt**: "Show me technology class action settlements"
**Expected**: ✅ Calls `find-settlements` with category="Technology"
**Status**: [ ] Pass / [ ] Fail

---

## Indirect Prompts (Should trigger the connector)

### 6. Data Breach Compensation
**Prompt**: "Can I get money from data breaches?"
**Expected**: ✅ Calls `find-settlements`, possibly with category="Technology"
**Status**: [ ] Pass / [ ] Fail

### 7. Privacy Violations
**Prompt**: "Are there any lawsuits for privacy violations I can join?"
**Expected**: ✅ Calls `find-settlements` with category="Technology"
**Status**: [ ] Pass / [ ] Fail

### 8. Consumer Rights
**Prompt**: "Help me find compensation for false advertising"
**Expected**: ✅ Calls `find-settlements` with category="Consumer"
**Status**: [ ] Pass / [ ] Fail

### 9. Healthcare Issues
**Prompt**: "Are there any medical billing class actions?"
**Expected**: ✅ Calls `find-settlements` with category="Healthcare"
**Status**: [ ] Pass / [ ] Fail

### 10. Financial Settlements
**Prompt**: "Can I claim money from bank fee lawsuits?"
**Expected**: ✅ Calls `find-settlements` with category="Financial"
**Status**: [ ] Pass / [ ] Fail

---

## Negative Prompts (Should NOT trigger the connector)

### 11. Legal Advice
**Prompt**: "Should I sue my employer?"
**Expected**: ❌ Does NOT call `find-settlements` (use ChatGPT's general knowledge)
**Status**: [ ] Pass / [ ] Fail

### 12. Finding Lawyers
**Prompt**: "Find me a class action lawyer"
**Expected**: ❌ Does NOT call `find-settlements` (use web search or general knowledge)
**Status**: [ ] Pass / [ ] Fail

### 13. Individual Lawsuits
**Prompt**: "How do I file a lawsuit against a company?"
**Expected**: ❌ Does NOT call `find-settlements` (general legal advice)
**Status**: [ ] Pass / [ ] Fail

### 14. Unrelated Topics
**Prompt**: "What's the weather today?"
**Expected**: ❌ Does NOT call `find-settlements` (use weather tool)
**Status**: [ ] Pass / [ ] Fail

### 15. Tax Help
**Prompt**: "Help me file my taxes"
**Expected**: ❌ Does NOT call `find-settlements` (unrelated domain)
**Status**: [ ] Pass / [ ] Fail

---

## Edge Cases

### 16. Ambiguous Intent
**Prompt**: "Tell me about settlements"
**Expected**: ⚠️ May or may not call `find-settlements` (clarification needed)
**Status**: [ ] Pass / [ ] Fail

### 17. Past Tense
**Prompt**: "What class actions have I missed?"
**Expected**: ✅ Calls `find-settlements` (should show expired ones at the end)
**Status**: [ ] Pass / [ ] Fail

### 18. Specific Company
**Prompt**: "Are there any Facebook class actions?"
**Expected**: ✅ Calls `find-settlements`, possibly filters by Technology
**Status**: [ ] Pass / [ ] Fail

### 19. Multiple Categories
**Prompt**: "Show me healthcare and financial settlements"
**Expected**: ✅ Calls `find-settlements` twice or shows all with filtering
**Status**: [ ] Pass / [ ] Fail

### 20. Deadline Urgency
**Prompt**: "What class actions are expiring soon?"
**Expected**: ✅ Calls `find-settlements`, widget should sort by deadline
**Status**: [ ] Pass / [ ] Fail

---

## Testing Instructions

### How to Test
1. Open ChatGPT in **Developer Mode**
2. Link your Class Action Finder connector
3. For each prompt above:
   - Enter the exact prompt
   - Observe which tool gets called
   - Check the parameters passed
   - Verify the widget renders correctly
   - Mark Pass/Fail in the Status column

### Success Criteria
- **Direct prompts**: 100% recall (5/5 should trigger)
- **Indirect prompts**: 80%+ recall (4/5 should trigger)
- **Negative prompts**: 100% precision (0/5 should trigger)
- **Edge cases**: Document behavior for future reference

### Tracking Results
Create a log entry for each test run:

```
Date: 2025-10-25
Metadata Version: v1.0
Results:
- Direct: 5/5 ✅
- Indirect: 3/5 ⚠️ (missed prompts #7, #9)
- Negative: 5/5 ✅
- Edge: 3/5 ⚠️

Action Items:
- Update description to mention "privacy violations"
- Add "medical billing" to healthcare category description
```

---

## Iteration Log

### Version 1.0 (2025-10-25)
- Initial golden prompt set created
- 20 prompts covering direct, indirect, negative, and edge cases
- Ready for first round of testing

### Version 1.1 (TBD)
- Update based on test results
- Add prompts that failed unexpectedly
- Remove prompts that are too similar
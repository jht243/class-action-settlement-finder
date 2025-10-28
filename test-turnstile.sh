#!/bin/bash

echo "🔒 Testing Turnstile Integration"
echo "================================"
echo ""

# Test 1: Check if secret key is set
echo "Test 1: Checking .env file..."
if grep -q "TURNSTILE_SECRET_KEY" class-action_server_node/.env; then
    echo "✅ TURNSTILE_SECRET_KEY found in .env"
else
    echo "❌ TURNSTILE_SECRET_KEY not found in .env"
    echo "   Add this line to class-action_server_node/.env:"
    echo "   TURNSTILE_SECRET_KEY=0x4AAAAAAB88oQxvKf3YbzwBHTsOhQaNmYs"
    exit 1
fi
echo ""

# Test 2: Check if server is running
echo "Test 2: Checking if server is running..."
if lsof -ti:8003 > /dev/null 2>&1; then
    echo "✅ Server is running on port 8003"
else
    echo "❌ Server is not running"
    echo "   Start it with: cd class-action_server_node && PORT=8003 pnpm start"
    exit 1
fi
echo ""

# Test 3: Test without token (should fail)
echo "Test 3: Testing without Turnstile token..."
RESPONSE=$(curl -s -X POST http://localhost:8003/api/subscribe \
  -H "Content-Type: application/json" \
  -d '{
    "email": "test@example.com",
    "settlementId": "test",
    "settlementName": "Test",
    "deadline": "2025-12-31"
  }')

if echo "$RESPONSE" | grep -q "Security verification required"; then
    echo "✅ Correctly rejected request without token"
    echo "   Response: $RESPONSE"
else
    echo "❌ Unexpected response: $RESPONSE"
fi
echo ""

# Test 4: Test with fake token (should fail)
echo "Test 4: Testing with fake Turnstile token..."
RESPONSE=$(curl -s -X POST http://localhost:8003/api/subscribe \
  -H "Content-Type: application/json" \
  -d '{
    "email": "test@example.com",
    "settlementId": "test",
    "settlementName": "Test",
    "deadline": "2025-12-31",
    "turnstileToken": "fake-token-12345"
  }')

if echo "$RESPONSE" | grep -q "Security verification failed"; then
    echo "✅ Correctly rejected fake token"
    echo "   Response: $RESPONSE"
else
    echo "❌ Unexpected response: $RESPONSE"
fi
echo ""

echo "================================"
echo "✅ All backend tests passed!"
echo ""
echo "Next steps:"
echo "1. Rebuild: BASE_URL=https://assets-nu-virid.vercel.app pnpm run build"
echo "2. Deploy: vercel deploy assets --prod --yes"
echo "3. Restart server: lsof -ti:8003 | xargs kill -9 && cd class-action_server_node && PORT=8003 pnpm start"
echo "4. Test in ChatGPT with real email"
echo "5. Look for Turnstile widget in the modals"
echo ""

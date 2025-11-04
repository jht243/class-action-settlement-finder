# Mortgage Calculator MCP server (Node)

This directory contains a Model Context Protocol (MCP) server implemented with the official TypeScript SDK. The server exposes a mortgage calculator widget that helps users calculate monthly mortgage payments, analyze home financing options, and plan their home purchase budget.

## Prerequisites

- Node.js 18+
- pnpm, npm, or yarn for dependency management

## Install dependencies

```bash
pnpm install
```

If you prefer npm or yarn, adjust the command accordingly.

## Run the server

```bash
pnpm start
```

The script bootstraps the server over SSE (Server-Sent Events), which makes it compatible with the MCP Inspector as well as ChatGPT connectors. Once running you can list the tools and invoke the mortgage calculator.

The tool responds with:

- `content`: a text message confirming the mortgage calculation
- `structuredContent`: JSON payload containing the mortgage parameters (home price, down payment, loan term, interest rate, etc.)
- `_meta.openai/outputTemplate`: metadata that binds the response to the mortgage calculator widget

The widget provides detailed payment breakdowns, amortization schedules, and total cost analysis.

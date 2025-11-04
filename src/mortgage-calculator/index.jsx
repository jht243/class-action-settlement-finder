import React from "react";
import { createRoot } from "react-dom/client";

function HelloWorld() {
  return (
    <div style={{
      display: 'flex',
      alignItems: 'center',
      justifyContent: 'center',
      height: '100%',
      fontFamily: 'system-ui, -apple-system, sans-serif'
    }}>
      <div style={{
        textAlign: 'center',
        padding: '2rem'
      }}>
        <h1 style={{ fontSize: '2rem', marginBottom: '1rem' }}>
          🎉 Hello World!
        </h1>
        <p style={{ color: '#666' }}>
          Mortgage Calculator Widget is Loading Successfully!
        </p>
      </div>
    </div>
  );
}

function initWidget() {
  const root = document.getElementById("mortgage-calculator-root");
  if (!root) {
    throw new Error("Root element not found");
  }
  createRoot(root).render(<HelloWorld />);
}

if (document.readyState === 'loading') {
  document.addEventListener('DOMContentLoaded', initWidget);
} else {
  initWidget();
}

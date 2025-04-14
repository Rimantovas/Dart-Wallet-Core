const fs = require("fs");
const path = require("path");

function addForwardDeclarations(headerFile) {
  const content = fs.readFileSync(headerFile, "utf8");

  // Find all struct usages that need forward declarations
  const structPattern = /struct\s+(\w+)\s*\*?_Nonnull/g;
  const structs = new Set();
  let match;
  while ((match = structPattern.exec(content)) !== null) {
    structs.add(match[1]);
  }

  // Filter out already declared structs
  const declaredStructPattern = /struct\s+(\w+)\s*{/g;
  const declaredStructs = new Set();
  while ((match = declaredStructPattern.exec(content)) !== null) {
    declaredStructs.add(match[1]);
  }

  const structsToDeclare = [...structs].filter((s) => !declaredStructs.has(s));

  if (structsToDeclare.length > 0) {
    // Create forward declarations
    const forwardDeclarations =
      structsToDeclare.map((s) => `struct ${s};`).join("\n") + "\n";

    // Insert forward declarations after the #pragma once line
    const newContent = content.replace(
      /(#pragma once)/,
      `$1\n\n${forwardDeclarations}`
    );
    fs.writeFileSync(headerFile, newContent, "utf8");
    console.log(`Forward declarations added to ${headerFile}`);
  }
}

function processHeaders(directory) {
  fs.readdir(directory, (err, files) => {
    if (err) throw err;

    files.forEach((file) => {
      const filePath = path.join(directory, file);
      if (fs.lstatSync(filePath).isDirectory()) {
        processHeaders(filePath); // Recursively process subdirectories
      } else if (file.endsWith(".h")) {
        addForwardDeclarations(filePath);
      }
    });
  });
}

// Replace with your headers directory
const directory = "./gen/headers/TrustWalletCore";
processHeaders(directory);

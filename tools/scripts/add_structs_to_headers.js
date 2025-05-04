const fs = require("fs");
const path = require("path");

function addForwardDeclarations(headerFile) {
  const content = fs.readFileSync(headerFile, "utf8");

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

  // Also filter out already forward-declared structs
  const forwardDeclaredPattern = /struct\s+(\w+)\s*;/g;
  while ((match = forwardDeclaredPattern.exec(content)) !== null) {
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
    console.log(
      `Forward declarations added to ${headerFile}: ${structsToDeclare.join(
        ", "
      )}`
    );
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

const directory = "../../packages/dart_wallet_core_codegen/include";
processHeaders(directory);

import path from 'node:path';
import { fileURLToPath } from 'node:url';

import globals from 'globals';

const __dirname = path.dirname(fileURLToPath(import.meta.url));

export default [
  {
    ignores: ['dist/**', 'node_modules/**'],
  },
  {
    files: ['src/*.ts'],
  },
];

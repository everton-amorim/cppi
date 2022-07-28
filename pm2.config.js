'use strict';
const fs = require('fs');

const defaultCwd = '~/cppi';
let cwd = fs.existsSync(defaultCwd) ? defaultCwd : './';

module.exports = [{
    name: 'cppi',
    script: './www.js',
    cwd
}];

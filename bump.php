#!/usr/bin/env php
<?php
$sha1   = trim(`git ls-remote https://github.com/cnvogelg/amitools.git | grep HEAD | awk '{ print $1}'`);
$buffer = '';
$prefix = '    git checkout -qf ';

foreach (file(__DIR__ . '/Dockerfile') as $line) {
    if (strpos($line, $prefix) === 0) {
        $line = $prefix . $sha1 . ' && \\' . PHP_EOL;
    }

    $buffer .= $line;
}

file_put_contents(__DIR__ . '/Dockerfile', $buffer);


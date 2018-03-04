#!/usr/bin/env php
<?php
$buffer = file_get_contents('https://github.com/cnvogelg/amitools');
$prefix = '<a class="commit-tease-sha" href="/cnvogelg/amitools/commit/';
$sha1   = substr($buffer, strpos($buffer, $prefix) + strlen($prefix), 40);

$buffer = '';
$prefix = '    git checkout -qf ';

foreach (file(__DIR__ . '/Dockerfile') as $line) {
    if (strpos($line, $prefix) === 0) {
        $line = $prefix . $sha1 . ' && \\' . PHP_EOL;
    }

    $buffer .= $line;
}

file_put_contents(__DIR__ . '/Dockerfile', $buffer);


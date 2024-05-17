#!/bin/bash
pandoc -i index.md -o index.html -s -V css=tufte.css

#!/bin/sh

find "$1" -type f -name "*.js" -not -path "node_modules" -exec sed -e "\
	s/import\s{\s\([a-zA-Z_]\+\)\sas\s\([a-zA-Z_]\+\)\s}\sfrom\s\('[a-zA-Z_\-]\+'\);/const \2 = require(\3).\1;/; \
	s/import\s\([a-zA-Z_]\+\)\sfrom\s\('[a-zA-Z_\-]\+'\);/const \1 = require(\2);/; \
	s/import\s\*\sas\s\([a-zA-Z_]\+\)\sfrom\s\('[a-zA-Z_\-]\+'\);/const \1 = require(\2);/; \
	s/import\s{\s\([a-zA-Z_]\+\)\s}\sfrom\s\('[a-zA-Z_\-]\+'\);/const \1 = require(\2).\1;/" {} \;

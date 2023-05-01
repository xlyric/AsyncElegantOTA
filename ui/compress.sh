#!/bin/bash
gzip -9 page.html -c > ELEGANT_HTML
echo "#ifndef ElegantOTAWebpage_h
#define ElegantOTAWebpage_h
" > elegantWebpage.h
xxd -i ELEGANT_HTML >> elegantWebpage.h
echo "#endif" >> elegantWebpage.h
sed -i "s/unsigned char ELEGANT_HTML\[\]/const uint8_t ELEGANT_HTML\[\] PROGMEM/g" elegantWebpage.h
sed -i "s/unsigned int ELEGANT_HTML_len/const uint32_t ELEGANT_HTML_SIZE/g" elegantWebpage.h
cp  elegantWebpage.h ../src/elegantWebpage.h
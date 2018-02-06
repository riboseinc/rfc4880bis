for f in abstract middle back
do
   pandoc -t docbook -s ${f}.mkd > ${f}.tmp.xml
   sed -i.bak '/xmlns="http:\/\/docbook/d' ${f}.tmp.xml
   xsltproc --nonet transform.xsl ${f}.tmp.xml > ${f}.xml
   rm -rf ${f}.xml.bak ${f}.tmp.xml
done;

xml2rfc template.xml -f draft.txt --text

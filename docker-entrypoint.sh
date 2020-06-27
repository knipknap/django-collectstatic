#/bin/sh

pip3 install -r "$INPUT_REQUIREMENTS"

cd "$INPUT_MANAGE_PY_DIR"
python manage.py collectstatic --noinput

# Minify lacks a feature to skip unsupported files, so we need to loop instead...
cd "/github/workspace/$INPUT_STATIC_DIR"
find . -name "*.js" -o -name "*.css" -o -name "*.html" | while read infile; do
  echo "Minifying $INPUT_STATIC_DIR/$infile"
  #mkdir -p "/github/workspace/$INPUT_STATIC_DIR/$(dirname $infile)"
  minify -o "$infile" "$infile"
  #minify -o "/github/workspace/$INPUT_STATIC_DIR/$infile" "$infile" | cp -l "$infile" "/github/workspace/$INPUT_STATIC_OUT_DIR/$infile"
done

#/bin/sh

pip3 install -r "$INPUT_REQUIREMENTS"

cd "$INPUT_MANAGE_PY_DIR"
python manage.py collectstatic --noinput

cd "$INPUT_IN_STATIC_DIR"

find . -name "*.js" -o -name "*.css" -o -name "*.html" | while read infile; do
  mkdir -p "/github/workspace/$INPUT_STATIC_OUT_DIR/$(dirname $infile)"
  minify -o "/github/workspace/$INPUT_STATIC_OUT_DIR/$infile" "$infile"
done

#/bin/sh

pip3 install -r "$INPUT_REQUIREMENTS"

cd "$INPUT_MANAGE_PY_DIR"
python manage.py collectstatic --noinput

cd -
mkdir -p "$INPUT_STATIC_OUT_DIR"
minify -o "$INPUT_STATIC_OUT_DIR" "$INPUT_IN_STATIC_DIR"

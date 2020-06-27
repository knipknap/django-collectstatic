#/bin/sh

pip3 install -r $INPUT_REQUIREMENTS

cd $INPUT_MANAGE_PY_DIR
./manage.py collectstatic --noinput

cd -
minify -o $INPUT_STATIC_OUT_DIR $INPUT_IN_STATIC_DIR

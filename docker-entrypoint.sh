#/bin/sh

pip3 install -r $INPUT_REQUIREMENTS

cd $INPUT_MANAGE_PY_DIR
./manage.py collectstatic --noinput

cd -
minify $INPUT_STATIC_DIR

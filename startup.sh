#!/bin/bash

chown www-data:www-data /usr/moodledata
apache2ctl -DFOREGROUND

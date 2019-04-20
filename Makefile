# --------------------------
# -------- Settings --------
# --------------------------
FLAG_ENV_CREATED=env.flag
FLAG_REFRESHED=refreshed.flag

# --------------------------
# --------- FLAGs ----------
# --------------------------
$(FLAG_ENV_CREATED):
	virtualenv --system-site-packages --python=python3.6 .
	touch $(FLAG_ENV_CREATED)

.ONESHELL:
$(FLAG_REFRESHED): $(FLAG_ENV_CREATED) requirements.txt
	./install_requirements.sh
	touch $(FLAG_REFRESHED)

# --------------------------
# --------- PHONYs ---------
# --------------------------

.PHONY: init refresh
init refresh: $(FLAG_REFRESHED)

.PHONY: clean
clean:
	git clean -xdf

.PHONY: install
install:
	./install_bashprofile.sh

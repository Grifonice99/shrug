define GetFromPkg
$(shell node -p "require('./shrug/info.json').$(1)")
endef

NAME := $(call GetFromPkg,name)
VERSION := $(call GetFromPkg,version)

all:run

zip: shrug
	rm -rf ${NAME}_${VERSION}.zip
	zip -r ${NAME}_${VERSION}.zip ${NAME}

save: zip
	cp ${NAME}_${VERSION}.zip ./archives/

run: zip
	rm ./private/mods/${NAME}_*.zip 
	cp ${NAME}_${VERSION}.zip ./private/mods/
	~/factorio/bin/x64/factorio --executable-path ~/factorio/bin/x64/factorio --mod-directory ./private/mods --load-game ~/factorio/saves/shrug.zip --graphics-quality very-low

ft:
	~/factorio/bin/x64/factorio --executable-path ~/factorio/bin/x64/factorio --mod-directory ./private/mods --load-game ~//saves/shrug.zip --graphics-quality very-low

ft_multi:
	~/factorio2/bin/x64/factorio --executable-path ~/factorio2/bin/x64/factorio --mod-directory ./private/mods --graphics-quality very-low

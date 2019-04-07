
GXNEUR_ICONS=~/.local/share/gxneur-icons
SIZE=32x32

.PHONY: all

all: svgtopng resize copy clean

svgtopng:
	cd ./icons && \
	for i in *.svg; do \
		convert +antialias -background transparent "$$i" "$${i%.*}.png";\
	done

resize:
	cd ./icons && \
	for i in *.png; do \
		convert  "$$i" -resize $(SIZE) "$${i%.*}"_$(SIZE).png ;\
	done

copy:
	cd ./icons && \
	for i in *_$(SIZE).png; do \
		cp "$$i" $(GXNEUR_ICONS)/$${i%_*}.png ;\
	done

clean:
	rm ./icons/*.png

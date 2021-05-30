
u-boot-signed.itb: u-boot.dtb u-boot-nodtb.bin u-boot.its dtbs
	./tools/mkimage -D '-I dts -O dtb -p 0x1000' -f u-boot.its -k key1 $@
	./tools/mkimage -D '-I dts -O dtb -p 0x1000' -F -k key1 -K dts/dt-spl.dtb $@

os.itb: dtbs
	./tools/mkimage -D '-I dts -O dtb -p 0x1000' -f board/altera/arria10-socdk/fit_kernel_sdmmc_signed.its -k key2 $@
	./tools/mkimage -D '-I dts -O dtb -p 0x1000' -F -k key2 -K dts/dt.dtb $@


do_check_integrity:
	./tools/fit_check_sign -f u-boot-signed.itb -k dts/dt-spl.dtb
	./tools/fit_check_sign -f os.itb -k dts/dt.dtb

.PHONY: do_check_integrity


ifeq ($(TARGET_DEVICE),gta9)
# Generate a tar package which includes the recovery and vbmeta
RECOVERYTAR_DEPS := $(PRODUCT_OUT)/recovery.img

INSTALLED_RECOVERYTAR_TARGET := $(PRODUCT_OUT)/recovery-$(TARGET_PRODUCT).tar
$(INSTALLED_RECOVERYTAR_TARGET): $(RECOVERYTAR_DEPS)
	@echo "Recovery package: $@"
	$(hide) tar -cf $@ -C $(PRODUCT_OUT) recovery.img

.PHONY: recoverytar
recoverytar: $(INSTALLED_RECOVERYTAR_TARGET)

$(BUILT_TARGET_FILES_DIR): $(INSTALLED_RECOVERYTAR_TARGET)
$(BUILT_TARGET_FILES_PACKAGE): $(INSTALLED_RECOVERYTAR_TARGET)
endif

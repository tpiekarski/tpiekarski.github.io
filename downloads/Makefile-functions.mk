# Basic syntax
define print_anything
	@echo "\nMakefile: $(1)\n"
endef

test:
	$(call print_anything, "Testing a first function in a Makefile.")

# Example to color output with functions
define print
	@case ${2} in \
		gray)    echo "\e[90m${1}\e[0m" ;; \
		red)     echo "\e[91m${1}\e[0m" ;; \
		yellow)  echo "\e[93m${1}\e[0m" ;; \
		*)       echo "\e[97m${1}\e[0m" ;; \
	esac
endef

define print_info
	$(call print, $(1), "gray")
endef

define print_warning
	$(call print, $(1), "yellow")
endef

define print_error
	$(call print, $(1), "red")
endef

test_colors:
	$(call print_info, "That\'s an information only.")
	$(call print_warning, "That\'s a warning. Maybe you should do something.")
	$(call print_error, "That\'s an error. Do something! Now!")

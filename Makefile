key ?=	"^ $$"

nothing:
	@echo "unlock  -- unlock the password file"
	@echo "lock    -- lock the password file"
	@echo "show    -- unlock and view the contents of the password file"
	@echo "search  -- search for a given key in the password file"
	@echo "edit    -- edit the password and hint files"
	@echo

unlock:
	cp passwords.sec.gpg passwords.sec.gpg~
	gpg passwords.sec.gpg 

lock:	passwords.sec.gpg
	rm passwords.sec

passwords.sec.gpg:	passwords.sec
	cat passwords.sec | gpg -e > passwords.sec.gpg

show:
	gpg passwords.sec.gpg
	less passwords.sec
	rm passwords.sec
	clear

search:
	gpg passwords.sec.gpg
	-@grep -i ${key} passwords.sec
	rm passwords.sec

edit:	passwords.sec
	vi -c ":wincmd v" -c ":e passwords.desc" -c ":wincmd w" -c ":e passwords.sec"

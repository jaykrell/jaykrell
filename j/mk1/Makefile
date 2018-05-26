# Tests are written in C# to be amenable to tail calls.
# ildasm + perl + ilasm insert the tail instructions where appropriate.
# Original failing and edited expected-to-succeed executables are produced.

# NOTE: This one Makefile works with Microsoft nmake and GNU make.
# They use different conditional syntax, but each can be nested and inverted within the other.

all: check

ifdef _NMAKE_VER:
!ifdef _NMAKE_VER

#
# Microsoft nmake on Windows with desktop CLR
#

# If removing spaces changes it, it requires quoting.
# We cannot unconditionally quote, because .e.g of it being not defined.
!if "$(MONO: =)" != "$(MONO)"
Q="
!endif

RM_F = del 2>nul /f
ILDASM = ildasm /nobar /out:$@
ILASM = ilasm /quiet
RUN_EACH=for %%a in (
RUN_EACH_END=) do @$Q$(MONO)$Q %%a

!else
else

#
# GNU/Posix make on Unix with mono
#

RM_F = rm -f
ILDASM = ikdasm >$@
ILASM = ilasm
MONO ?= mono
RUN_EACH=for a in
RUN_EACH_END=;do $(MONO) $${a}; done

endif
!endif :

IL=\
  gptail1.il \
  itail1.il \
  itaili1.il \
  ivtail1.il \
  sirtail1.il \
  sitail1.il \
  srtail1.il \
  stail1.il \
  tail1.il \
  taili1.il \
  vtail1.il \

EXE=$(IL:.il=.exe)

check: exe
	-$Q$(MONO)$Q tailcall1.exe
	-$Q$(MONO)$Q tailcall1-tail.exe
	$(RUN_EACH) $(EXE) $(RUN_EACH_END)

clean:
	$(RM_F) $(EXE) $(IL) tailcall1-tail.exe tailcall1-tail.il tailcall1.il2 tailcall1.exe

exe: tailcall1.exe tailcall1-tail.exe $(EXE)

.SUFFIXES: .il .exe

il: tailcall1.il2 tailcall1-tail.il $(IL)

.il.exe:
	$(ILASM) $? /out:$@

# $(IL) is by-product
tailcall1-tail.il $(IL): tailcall1.il2 tailcall1.pl
	perl tailcall1.pl < tailcall1.il2 > tailcall1-tail.il

# We have to rename this file to prevent a cycle.
tailcall1.il2: tailcall1.exe
	$(ILDASM) $?
	$(RM_F) tailcall1.res

tailcall1.exe: tailcall1.cs
	csc /optimize /unsafe $? /out:$@

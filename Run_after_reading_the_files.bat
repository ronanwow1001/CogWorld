@echo off
username:AlphaDog
password:codemonkey
echo TTIGAMESERVER=TTIGAMECOOKIE
echo bam_info collected
read of ___dc___ file
starting the game...
#!/usr/bin/python2.7 -OO
# Yes, the above flags matter: We have to do this on 2.7 and we have to optimize.

from modulefinder import ModuleFinder
import os
import sys
import subprocess
import imp
import marshal
import tempfile
import shutil
import atexit
import argparse
import zipfile

# These are to get the dependency walker to find and binarize them, as they would not be found by it normally
EXTRA_MODULES = (
  'encodings.ascii',
  'encodings.latin_1',
  'encodings.hex_codec',
  '_strptime',

  # Animated props and things loaded through DNA...
  'toontown.hood.MailboxZeroAnimatedProp',
  'toontown.hood.PetShopFishAnimatedProp',
  'toontown.hood.TrashcanOneAnimatedProp',
  'toontown.hood.SleepingHydrantAnimatedProp',
  'toontown.hood.HQPeriscopeAnimatedProp',
  'toontown.hood.HydrantTwoAnimatedProp',
  'toontown.hood.HydrantZeroAnimatedProp',
  'toontown.hood.AnimatedProp',
  'toontown.hood.HQTelescopeAnimatedProp',
  'toontown.hood.MailboxTwoAnimatedProp',
  'toontown.hood.GenericAnimatedProp',
  'toontown.hood.GenericAnimatedBuilding',
  'toontown.hood.FishAnimatedProp',
  'toontown.hood.HydrantOneAnimatedProp',
  'toontown.hood.TrashcanZeroAnimatedProp',
  'toontown.hood.TrashcanTwoAnimatedProp',
  'toontown.hood.InteractiveAnimatedProp',
  'toontown.hood.MailboxOneAnimatedProp',
  'toontown.hood.ZeroAnimatedProp',
  'toontown.hood.HydrantInteractiveProp',
  'toontown.hood.MailboxInteractiveProp',
  'toontown.hood.TrashcanInteractiveProp',
)

root = os.path.realpath(os.path.join(os.path.dirname(__file__), '..'))
set /P ttiUsername="Username (DEFAULT: username): " || ^
set ttiUsername=username
set ttiPassword=password
set TTI_PLAYCOOKIE=%ttiUsername%
set TTI_GAMESERVER=127.0.0.1

rem Read the contents of PPYTHON_PATH into %PPYTHON_PATH%:
set /P PPYTHON_PATH=<PPYTHON_PATH

%PPYTHON_PATH% -m toontown.toonbase.ToontownStart

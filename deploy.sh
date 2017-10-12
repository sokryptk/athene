#!/usr/bin/env sh

# Variables and Checks.
KernelZip=Arenium-O.zip
if [[ -e $PWD/$KernelZip ]] ; then rm -rf $PWD/$KernelZip ; fi
cp -rf $AKdir/$KernelZip $PWD/$KernelZip


curl -F chat_id="-1001143664346" -F document=@"$PWD/$KernelZip" https://api.telegram.org/bot$BOT_API_KEY/sendDocument
# curl -F chat_id="-1001079512482" -F document=@"$PWD/$KernelZip" https://api.telegram.org/bot$BOT_API_KEY/sendDocument

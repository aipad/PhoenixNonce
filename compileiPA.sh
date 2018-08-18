#!/bin/bash

echo "[*] Compiling..."
$(which xcodebuild) clean build CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO -sdk iphoneos
mv build/Release-iphoneos/PhoenixNonce.app PhoenixNonce.app
mkdir Payload
mv PhoenixNonce Payload/PhoenixNonce.app

echo "[*] Zipping into .ipa..."
zip -r9 PhoenixNonce.ipa Payload/PhoenixNonce.app

echo '[*] Cleaning up..."
rm -rf build Payload

echo "[*] Done!"



if [ -d ~/.multirust ]; then
    for toolchain in ~/.multirust/toolchains/*; do
        if [ -d ${toolchain}/cargo/bin ]; then
            export PATH="${toolchain}/cargo/bin:$PATH"
        fi
    done
fi

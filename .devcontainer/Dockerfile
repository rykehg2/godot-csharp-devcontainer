# Fedora moderno
FROM fedora:43

RUN dnf -y update && dnf clean all

# 🔧 TOOLCHAIN (baseado no build-containers)
RUN dnf install -y \
    git \
    wget \
    unzip \
    which \
    python3 \
    python3-pip \
    gcc \
    gcc-c++ \
    make \
    clang \
    cmake \
    ninja-build \
    pkgconf-pkg-config \
    # libs runtime
    libX11 \
    libXcursor \
    libXrandr \
    libXinerama \
    libXi \
    libXext \
    libXrender \
    mesa-libGL \
    alsa-lib \
    pulseaudio-libs \
    fontconfig \
    freetype \
    libpng \
    libogg \
    libvorbis \
    # 🔥 headers (IMPORTANTE)
    libX11-devel \
    libXcursor-devel \
    libXrandr-devel \
    libXinerama-devel \
    libXi-devel \
    libXext-devel \
    libXrender-devel \
    mesa-libGL-devel \
    alsa-lib-devel \
    # 🔥 build deps
    openssl-devel \
    zlib-devel \
    # 🔥 Vulkan (muito importante)
    vulkan-loader \
    vulkan-loader-devel \
    # .NET
    dotnet-sdk-8.0 \
    && dnf clean all

# SCons (igual Godot)
RUN pip3 install scons==4.10.1

# 🔥 (OPCIONAL mas poderoso)
# Mono ajuda em compatibilidade com alguns tools do Godot
RUN dnf install -y mono-complete || true

# =========================
# GODOT .NET (já validado)
# =========================

ENV GODOT_VERSION=4.6.2
ENV GODOT_FILE_ZIP=Godot_v${GODOT_VERSION}-stable_mono_linux_x86_64
ENV GODOT_FILE=Godot_v${GODOT_VERSION}-stable_mono_linux.x86_64

RUN wget https://github.com/godotengine/godot/releases/download/${GODOT_VERSION}-stable/${GODOT_FILE_ZIP}.zip

RUN unzip ${GODOT_FILE_ZIP}.zip
RUN mv ${GODOT_FILE_ZIP}/* /usr/local/bin/
RUN rm -rf ${GODOT_FILE_ZIP} ${GODOT_FILE_ZIP}.zip

RUN mv /usr/local/bin/${GODOT_FILE} /usr/local/bin/godot
RUN chmod +x /usr/local/bin/godot

ENV PATH="/usr/local/bin:$PATH"

# =========================
# VALIDAÇÃO
# =========================

RUN godot --version
RUN dotnet --version

WORKDIR /workspace

# Teste automático de C#
#COPY .devcontainer/tests/test_csharp.sh /test_csharp.sh
COPY tests/test_csharp.sh /test_csharp.sh
RUN chmod +x /test_csharp.sh && /test_csharp.sh
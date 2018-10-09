FROM gcc:7.2.0 as build
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    git unzip
RUN mkdir -p /cmake/ \
    && cd /cmake/ \
    && wget -nc https://cmake.org/files/v3.10/cmake-3.10.2-Linux-x86_64.sh \
    && chmod +x cmake-3.10.2-Linux-x86_64.sh \
    && mkdir cmake \
    && ./cmake-3.10.2-Linux-x86_64.sh --skip-license
RUN cd /cmake \
    && ln -s /cmake/bin/* /usr/local/bin/


# Create the actual image to use to build project
#
# Create target directories
RUN mkdir -p /cmake/bin \
    && mkdir -p /cmake/share \
    && mkdir -p /opencv/opencv-3.4.0 \
    && mkdir -p /glm

FROM gcc:7.2.0
# Setup cmake from builder
COPY --from=build /cmake/bin /cmake/bin
COPY --from=build /cmake/share /cmake/share
RUN cd /cmake \
    && ln -s /cmake/bin/* /usr/local/bin/


# Copy and build our actual project
# Layers below will only be built if our project changes
RUN mkdir -p /general-lib
WORKDIR /general-lib
COPY general-lib .

RUN ls -la

RUN mkdir -p _build && cd _build && cmake -G"Unix Makefiles" ../ && make -j8
CMD make -C _build -j8 check

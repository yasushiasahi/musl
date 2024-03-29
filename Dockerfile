FROM rust:1.75

RUN apt update
RUN apt install -y linux-musl-dev
# RUN apt install -y musl-tools
# RUN apt install -y musl-dev

RUN rustup target add x86_64-unknown-linux-musl

WORKDIR /usr/src/

RUN cargo new hello

WORKDIR /usr/src/hello

RUN cargo add reqwest -F json
RUN cargo add openssl -F vendored

RUN cargo build --target x86_64-unknown-linux-musl --release

RUN ldd ./target/x86_64-unknown-linux-musl/release/hello

RUN ./target/x86_64-unknown-linux-musl/release/hello

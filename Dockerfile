FROM rust:1.75

RUN apt update && apt install -y musl-tools musl-dev pkg-config libssl-dev

RUN rustup target add x86_64-unknown-linux-musl

WORKDIR /usr/src/

RUN cargo new hello

WORKDIR /usr/src/hello

RUN cargo add reqwest -F json

RUN cargo build --target x86_64-unknown-linux-musl --release

RUN ldd ./target/x86_64-unknown-linux-musl/release/hello

RUN ./target/x86_64-unknown-linux-musl/release/hello

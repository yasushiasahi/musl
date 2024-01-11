FROM rust:1.75

RUN apt update && apt install -y musl-tools musl-dev

RUN rustup target add x86_64-unknown-linux-musl

WORKDIR /usr/src/

RUN cargo new hello

WORKDIR /usr/src/

RUN cargo add axum

RUN cargo build --target x86_64-unknown-linux-musl --release
RUN ./target/x86_64-unknown-linux-musl/release/hello

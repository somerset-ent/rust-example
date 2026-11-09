FROM rust:slim-bookworm AS build

WORKDIR /usr/src/rust-example
COPY . .

RUN cargo install --path .

FROM debian:bookworm-slim
COPY --from=build /usr/local/cargo/bin/rust-example /usr/local/bin/rust-example

CMD ["rust-example"]
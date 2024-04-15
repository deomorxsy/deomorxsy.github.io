---
layout: blog-posts
title:  "Image Resizing"
date:   2018-12-11 15:40:50
categories: tech
tags:
- shellscript
---

## slim Rust+wasm OCI Containers: common error return messages

This post covers the outcome of a multi-stage Dockerfile for Rust, which handles the app artifact binary to the last layer, discarding the build layer.

- High-level container runtime: Podman
- Low-level container runtime: crun
- Trunk with wasm-bidgen as dependency for a Yew project.

OCI Setup specs:
```sh
; podman -v
podman version 4.9.0
;
; crun -v
crun version 1.14
commit: 667e6ebd4e2442d39512e63215e79d693d0780aa
rundir: /run/user/1000/crun
spec: 1.0.0
+SYSTEMD +SELINUX +APPARMOR +CAP +SECCOMP +EBPF +CRIU +YAJL
;
```

Two attempts of running without declaring backtrace:
```sh
; podman run --rm -it b0ff5e339a75
thread 'main' panicked at /usr/local/cargo/registry/src/index.crates.io-6f17d22bba15001f/js-sys-0.3.69/src/lib.rs:6013:9:
cannot call wasm-bindgen imported functions on non-wasm targets
note: run with `RUST_BACKTRACE=1` environment variable to display a backtrace
;
;
; podman run --rm -it b0ff5e339a75 -e RUST_BACKTRACE=1
Error: container create failed (no logs from conmon): conmon bytes "": readObjectStart: expect { or n, but found , error found in #0 byte of ...||..., bigger context ...||...
```

Just pass the environment variable flag "-e" before the image ID:
```sh
;
; podman run --rm -it -e=RUST_BACKTRACE=1 b0ff5e339a75
thread 'main' panicked at /usr/local/cargo/registry/src/index.crates.io-6f17d22bba15001f/js-sys-0.3.69/src/lib.rs:6013:9:
cannot call wasm-bindgen imported functions on non-wasm targets
stack backtrace:
   0: std::panicking::begin_panic
   1: js_sys::global::get_global_object
   2: std::sys::pal::common::thread_local::fast_local::Key<T>::try_initialize
   3: js_sys::global
   4: web_sys::window
   5: gloo_utils::document
   6: client::main
note: Some details are omitted, run with `RUST_BACKTRACE=full` for a verbose backtrace.
;
```

Getting a verbose backtrace:
```sh
; podman run --rm -it -e=RUST_BACKTRACE=full b0ff5e339a75
thread 'main' panicked at /usr/local/cargo/registry/src/index.crates.io-6f17d22bba15001f/js-sys-0.3.69/src/lib.rs:6013:9:
cannot call wasm-bindgen imported functions on non-wasm targets
stack backtrace:
   0:     0x7b6c5848db96 - <std::sys_common::backtrace::_print::DisplayBacktrace as core::fmt::Display>::fmt::hf8249b6db016cdd6
   1:     0x7b6c584c0af0 - core::fmt::write::h8cd11f932493d2bc
   2:     0x7b6c5848bd4f - std::io::Write::write_fmt::h37d94ca5dba92725
   3:     0x7b6c5848d974 - std::sys_common::backtrace::print::h81e1032a6a6ee15a
   4:     0x7b6c5848f0b7 - std::panicking::default_hook::{{closure}}::h5fbe45a5c9c06360
   5:     0x7b6c5848ee19 - std::panicking::default_hook::hb25b5c97a3dd366b
   6:     0x7b6c5848f548 - std::panicking::rust_panic_with_hook::h7d671b1197a07e3d
   7:     0x7b6c58472aad - std::panicking::begin_panic::{{closure}}::h3980c7524c3a63d3
   8:     0x7b6c58472a76 - std::sys_common::backtrace::__rust_end_short_backtrace::hb84cae0a7c2b9246
   9:     0x7b6c5843fd1a - std::panicking::begin_panic::hf35555bd7972a40d
  10:     0x7b6c584723f9 - js_sys::global::get_global_object::hba56d1ba3757affb
  11:     0x7b6c5847262a - std::sys::pal::common::thread_local::fast_local::Key<T>::try_initialize::h8ee205ce75587eeb
  12:     0x7b6c584723a7 - js_sys::global::hd789fb15e9fd1436
  13:     0x7b6c58471daa - web_sys::window::hca2399c82797c271
  14:     0x7b6c58471b7b - gloo_utils::document::h1b0bdba7922a03db
  15:     0x7b6c5844931b - client::main::hd90b0daf8225f262
  16:     0x7b6c5844a5b3 - std::sys_common::backtrace::__rust_begin_short_backtrace::h2afc5950a67af069
  17:     0x7b6c5844a5c9 - std::rt::lang_start::{{closure}}::hb50cbb3c95f0e3c4
  18:     0x7b6c58489478 - std::rt::lang_start_internal::h71ac9203d98bddf4
  19:     0x7b6c58449f15 - main
;
```

This lab setup was inspired by [torrust's](https://torrust.com/containerizing-rust-applications-best-practices) and [codefeetime's](https://www.codefeetime.com/post/docker-config-for-actix-web-diesel-and-postgres/) blog posts.

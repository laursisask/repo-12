//! Utilities

use std::{
    fs::{self, OpenOptions},
    io::Write,
    os::unix::fs::OpenOptionsExt,
    path::Path,
};

use ed25519::SigningKey;
use ed25519_consensus as ed25519;
use rand_core::OsRng;
use subtle_encoding::base64;
use tmkms_light::error::{io_error_wrap, Error};
use zeroize::Zeroizing;

/// File permissions for secret data
pub const SECRET_FILE_PERMS: u32 = 0o600;

/// Load Base64-encoded secret data (i.e. key) from the given path
pub fn load_base64_secret(path: impl AsRef<Path>) -> Result<Zeroizing<Vec<u8>>, Error> {
    // TODO(tarcieri): check file permissions are correct
    let base64_data = Zeroizing::new(fs::read_to_string(path.as_ref()).map_err(|e| {
        Error::io_error(
            format!("couldn't read key from {}: {}", path.as_ref().display(), e),
            e,
        )
    })?);

    // TODO(tarcieri): constant-time string trimming
    let data = Zeroizing::new(base64::decode(base64_data.trim_end()).map_err(|e| {
        io_error_wrap(
            format!("can't decode key from `{}`: {}", path.as_ref().display(), e),
            e,
        )
    })?);

    Ok(data)
}

/// Load a Base64-encoded Ed25519 secret key
pub fn load_base64_ed25519_key(path: impl AsRef<Path>) -> Result<ed25519::SigningKey, Error> {
    let key_bytes = load_base64_secret(path)?;

    let secret =
        ed25519::SigningKey::try_from(&key_bytes[..]).map_err(|_e| Error::invalid_key_error())?;

    Ok(secret)
}

/// Store Base64-encoded secret data at the given path
pub fn write_base64_secret(path: impl AsRef<Path>, data: &[u8]) -> Result<(), Error> {
    let base64_data = Zeroizing::new(base64::encode(data));

    OpenOptions::new()
        .create(true)
        .write(true)
        .truncate(true)
        .mode(SECRET_FILE_PERMS)
        .open(path.as_ref())
        .and_then(|mut file| file.write_all(&base64_data))
        .map_err(|e| {
            Error::io_error(
                format!("couldn't write `{}`: {}", path.as_ref().display(), e),
                e,
            )
        })
}

/// Generate a Secret Connection key at the given path
#[allow(clippy::explicit_auto_deref)]
pub fn generate_key(path: impl AsRef<Path>) -> Result<(), Error> {
    let secret_key = SigningKey::new(OsRng);
    write_base64_secret(path, &secret_key.as_bytes()[..])
}

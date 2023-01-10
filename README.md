# Install Curl with HTTP3 support on MacOS

Problem
----

The current official implementation of `curl` does not support HTTP3 yet.

Running:

```bash
curl --http3 https://d13ddxylvjzgk0.cloudfront.net/time/0
```

Returns:

```
option --http3: the installed libcurl version doesn't support this
```

Solution
----

## Pre-requisites

* brew
* git
* zsh (recommended)

## Installation

Run the `install_curl_http3.sh` script:

```bash
chmod +x install_curl_http3.sh
./install_curl_http3.sh
```

The script will download a forked `homebrew-cloudfare` repository that has a patched version of the ruby install script `curl.rb`. Then it will use `brew install` to install curl. Finally it will add the installed `curl` PATH to the `.zshrc` file.

**Note:** If you're not using `zsh` manually append to your PATH: `PATH="/opt/homebrew/opt/curl/bin:$PATH"`

## Testing

Run the `test_curl_http3.sh` script:

```bash
chmod +x test_curl_http3.sh
./test_curl_http3.sh
```

If `curl` was installed successfully it will return:

```
Curl with HTTP3 intalled correctly.
Testing curl HTTP3 with PubNub's Timetoken api...
Time provided by PubNub: Tue Jan 10 17:57:39 EST 2023
```

## Uninstall

To remove installed `curl` with HTTP3 support run:

```bash
brew remove -f curl
```

## Contributing

If you find any issues or have any suggestions please open an issue or pull request.

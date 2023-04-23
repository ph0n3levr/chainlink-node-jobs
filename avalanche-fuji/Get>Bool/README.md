# Get > Bool

This job retrieves a `bool` from a internet-facing JSON API.

## Oracle Contract Address & JobID
  
Oracle Contract: [0x26a03479361c43ecC94602ea67672a42625efb11](https://testnet.snowtrace.io/address/0x26a03479361c43ecC94602ea67672a42625efb11)

JobID: c4cb120c4e7046d28eab580423a9643d

## Parameters

The job requires the following parameters to be specified:

* `get` - internet-facing URL from where the integer is retrieved
* `path` - comma-separated JSON path used to extract the integer value

Note: use commas not dots for JSON paths.

## Price

0.00 LINK*  Currently Free to test 

## Example

If you set the following parameters use quotations when entering into the fulfillValue _url & _path

* get : https://raw.githubusercontent.com/ph0n3levr/chainlink-node-jobs/main/avalanche-fuji/Get%3EBool/example.json
* path : values,trueValue

Note: use commas not dots for JSON paths.

You will receive a JSON response that may look like this:

    {
      "values": {
        "trueValue": true,
        "falseValue": false
      }
    }

The job populated with the example parameters above would return with: `true`

See [example.sol](example.sol) for an example client contract.


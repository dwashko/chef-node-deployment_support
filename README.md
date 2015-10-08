# node-deployment_support-cookbook

This is the support cookbook for node applications. This cookbook includes recipes to control node applciations. Currently there is a recipe for controlling node applications using npm via a sysvinit script. . Testing of the service should be done in the role cookbook. The test in this cookbook is simply generic. 
## Supported Platforms

RedHat Platforms are supported. Does not currently implement systemd, so only sysvinit.

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['node-deployment']['name']</tt></td>
    <td>String</td>
    <td>should be set in role cookbook. Name of node application</td>
    <td><tt></tt></td>
  </tr>
  <tr>
    <td><tt>['node-deployment']['user']</tt></td>
    <td>String</td>
    <td>should be set in role cookbook. User node application should run under</td>
    <td><tt></tt></td>
  </tr>
  <tr>
    <td><tt>['node-deployment']['npm_application']</tt></td>
    <td>String</td>
    <td>should be set in role cookbook. Path to npm binary for applications using npm</td>
    <td><tt>/usr/bin/npm</tt></td>
  </tr>
  <tr>
    <td><tt>['node-deployment']['app_root_directory']</tt></td>
    <td>String</td>
    <td>should be set in role cookbook. Path to the root or home directory of the node application</td>
    <td><tt></tt></td>
  </tr>
  <tr>
    <td><tt>['node-deployment']['start_command']</tt></td>
    <td>String</td>
    <td>should be set in role cookbook. Command used with start_appliation to start your node application</td>
    <td><tt>start</tt></td>
  </tr>
  <tr>
    <td><tt>['node-deployment']['stop_command']</tt></td>
    <td>String</td>
    <td>should be set in role cookbook. Command used wiht start_application to stop your node application</td>
    <td><tt>stop</tt></td>
  </tr>
</table>

## Usage

### node-deployment_support::default

Include `node-deployment_support::npmservice` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[node-deployment_support::npmservice]"
  ]
}
```

## License and Authors

Author:: daniel washko (<dwashko@gannett.com>)

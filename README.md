Description
==============
This cookbook installs Vert.x. It defaults to installing Oracle JDK 8, but it can also install OpenJDK. 

Requirements
------------
Chef 0.10.10+ and Ohai 6.10+ for `platform_family` use.

## Platform
* Debian, Ubuntu
* CentOS, Red Hat, Fedora, Amazon


Attributes
----------
See `attributes/default.rb` for default values.

* `node[:vertx][:version]` - Vert.x version to install, defaults to `'2.1.5'`
* `node[:vertx][:home]` - Default location of Vert.x, defaults to `'/srv/vertx'`
* `node[:vertx][:url]` - Download url of Vert.x, defaults to `'http://dl.bintray.com/vertx/downloads/vert.x-2.1.5.tar.gz'`


Usage
-----
#### vertx::default

Just include `vertx` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[vertx]"
  ]
}
```

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------

* Author: Sander van de Graaf (<sander.vandegraaf@unitt.com>)
* Original Author: Sascha Möllering (<sascha.moellering@zanox.com>)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.


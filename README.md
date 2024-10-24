# php-cs-fixer.el

**Minimalist PHP-CS-Fixer integration for Emacs**

## Overview

`php-cs-fixer.el` is a simple Emacs package that integrates [PHP CS Fixer](https://github.com/FriendsOfPHP/PHP-CS-Fixer) into your Emacs workflow for PHP development. This package allows you to automatically format your PHP code according to specified coding standards every time you save a PHP file.

## Features

- **Run PHP CS Fixer on Current Buffer**: The `run-php-cs-fixer-on-buffer` function formats the current PHP buffer and updates it with the fixed content.
- **Automatic Formatting on Save**: The `add-php-cs-fixer-on-save` function hooks into the `before-save-hook`, ensuring that PHP CS Fixer runs every time you save a PHP file.

## Installation

1. Ensure you have [PHP CS Fixer](https://github.com/FriendsOfPHP/PHP-CS-Fixer) installed on your system and accessible in your PATH.
2. Copy `php-cs-fixer.el` to your Emacs `load-path`.
3. Add the following to your Emacs configuration:

   ```
   (require 'php-cs-fixer)
   ```

## Usage

- Open a PHP file in Emacs.
- The PHP CS Fixer will automatically run each time you save the file. You will receive a message confirming that the fixer has been applied.

### Manual Fixing

If you want to run PHP CS Fixer manually on the current buffer without saving, you can invoke the command:

   ```
   M-x run-php-cs-fixer-on-buffer
   ```

## Customization

The PHP CS Fixer command can be customized by modifying the `fixer-command` format string within the `run-php-cs-fixer-on-buffer` function. 

By default, it uses the following rules:

- `@PHP80Migration`
- `@PSR12`
- `@Symfony`
- `@PhpCsFixer`

Feel free to adjust these rules based on your project's requirements.

## License

This package is released under the AGPL-3.0 License. See the LICENSE file for more details.


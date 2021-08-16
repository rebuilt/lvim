-- https://prettier.io/docs/en/install.html
-- npm install --save-dev --save-exact prettier
-- echo {}> .prettierrc.json

-- lvim.lang["markdown"] = {
-- 	formatters = {
-- 		{
-- 			exe = "prettier",
-- 		},
-- 	},
-- }

-- https://github.com/DavidAnson/markdownlint
-- npm install markdownlint --save-dev

-- https://github.com/igorshubovych/markdownlint-cli
-- npm install -g markdownlint-cli
-- brew install markdownlint-cli
-- lvim.lang["markdown"] = {
-- 	linters = {
-- 		{
-- 			-- @usage can be write_good or vale or markdownlint
-- 			exe = "markdownlint",
-- 		},
-- 		{
-- 			-- @usage can be write_good or vale or markdownlint
-- 			exe = "vale",
-- 		},
-- 	},
-- }

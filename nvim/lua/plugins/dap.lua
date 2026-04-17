---@type LazySpec
return {
  -- Ensure delve is installed via Mason
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "delve",
      },
    },
  },

  -- Configure nvim-dap for Go
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require "dap"

      -- Go adapter (delve)
      dap.adapters.delve = {
        type = "server",
        port = "${port}",
        executable = {
          command = "dlv",
          args = { "dap", "-l", "127.0.0.1:${port}" },
        },
      }

      -- Helper: read .env file and return as table
      local function load_env_file(path)
        local env = {}
        local f = io.open(path, "r")
        if not f then return env end
        for line in f:lines() do
          -- skip comments and empty lines
          if line:match "^%s*[^#]" then
            local key, value = line:match "^%s*([%w_]+)%s*=%s*(.*)"
            if key and value then
              -- strip surrounding quotes
              value = value:gsub('^"(.*)"$', "%1"):gsub("^'(.*)'$", "%1")
              env[key] = value
            end
          end
        end
        f:close()
        return env
      end

      -- OpenBP project root (adjust if needed)
      local openbp_root = vim.fn.expand "~/Documents/Mark/Programming/openbp"

      -- Build env table from .env + overrides
      local function openbp_env()
        local env = load_env_file(openbp_root .. "/.env")
        env["GIN_MODE"] = "debug"
        env["OTEL_EXPORTER_OTLP_INSECURE"] = "true"
        return env
      end

      dap.configurations.go = {
        {
          name = "Launch OpenBP Server",
          type = "delve",
          request = "launch",
          program = openbp_root .. "/openbp/main.go",
          buildFlags = "-tags=file2llm_feature_ocr_tesseract,file2llm_feature_pdf",
          args = {
            "serve",
            "--telemetry-enabled", "true",
            "--http-port", "5555",
            "--http-cors-origins", "*",
            "--http-cors-headers", "*",
            "--http-cors-methods", "*",
            "--http-frontend-crmClientPortal-host", "portal.localhost:5555",
            "--http-frontend-myBusiness-host", "mybusiness.localhost:5555",
          },
          env = openbp_env,
          cwd = openbp_root,
        },
        {
          name = "Launch OpenBP Server (Dependless)",
          type = "delve",
          request = "launch",
          program = openbp_root .. "/openbp/main.go",
          args = {
            "serve",
            "--telemetry-enabled", "true",
            "--http-port", "5555",
            "--http-cors-origins", "*",
            "--http-cors-headers", "*",
            "--http-cors-methods", "*",
            "--http-frontend-crmClientPortal-host", "portal.localhost:5555",
            "--http-frontend-myBusiness-host", "mybusiness.localhost:5555",
          },
          env = openbp_env,
          cwd = openbp_root,
        },
        {
          -- Generic: debug current file
          name = "Debug current file",
          type = "delve",
          request = "launch",
          program = "${file}",
        },
        {
          -- Generic: debug current package
          name = "Debug current package",
          type = "delve",
          request = "launch",
          program = "${fileDirname}",
        },
      }
    end,
  },
}

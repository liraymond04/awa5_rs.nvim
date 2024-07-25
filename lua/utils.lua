local M = {}

function M.read_file(file_path)
  local file = io.open(file_path, "r")
  if not file then
    print("Failed to open file: " .. file_path)
    return nil
  end
  local contents = file:read("*a")
  file:close()
  return contents
end

return M

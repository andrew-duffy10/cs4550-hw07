defmodule SchedulerWeb.ListHelpers do
    use Phoenix.HTML
# This structure was created following the guide here:
# https://medium.com/@chipdean/phoenix-array-input-field-implementation-7ec0fe0949d
    
def list_input(form, field) do
    items = Phoenix.HTML.Form.input_value(form, field) || [""]
    input_id = Phoenix.HTML.Form.input_id(form, field)
    content_tag :ol, id: input_id <> "_container", class: "input_container", data: [index: Enum.count(items) ] do
    items
        |> Enum.with_index()
        |> Enum.map(fn {item, idx} -> new_id = 
        input_id <> "_idx_#{idx}"
        options = [ 
            name: Phoenix.HTML.Form.input_name(form, field) <> "[]",
            value: item,
            id: input_id,
            class: "form-control"]
    list_display(form, field, item, idx) end)
end end

defp list_display(form, field, item, idx) do
    type = Phoenix.HTML.Form.input_type(form, field)
    input_id = Phoenix.HTML.Form.input_id(form,field)
    new_id = input_id <> "_idx_#{idx}"
    input_opts = [
      name: Phoenix.HTML.Form.input_name(form, field) <> "[]",
      value: item,
      id: new_id,
      class: "form-control"
    ]
content_tag :li do
  [
    apply(Phoenix.HTML.Form, type, [form, field, input_opts]),
    link("Remove", to: "#", data: [id: new_id], title: "Remove", class: "removelistitem")
   ]
 end
  end

def list_add_button(form, field) do
  input_id = Phoenix.HTML.Form.input_id(form,field)
  content = list_display(form,field,"","__name__")
    |> safe_to_string
  data = [
    prototype: content,
    container: input_id <> "_container"
  ];
  link("Add", to: "#",data: data, class: "addlistitem")
end
end




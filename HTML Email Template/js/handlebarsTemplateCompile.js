export function renderTemplate(templateId, data) {
    const source = document.querySelector(templateId).innerHTML;
    const template = Handlebars.compile(source);
    return template(data);
}


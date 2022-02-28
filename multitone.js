const normal = number => Math.min(1, Math.max(0, Math.floor(number*1000)/1000))

const element = (name, options, ...children) => {
	const result = document.createElementNS('http://www.w3.org/2000/svg', name)
	Object.entries(options).forEach(([key, value]) => {
		result.setAttribute(key, value)
	})
	result.append(...children)
	return result
}

export default (id, ...colors) => {
	const components = [[], [], []]
	colors.forEach(color => {
		for (let i=0; i<3; i++) {
			components[i].push(normal(color[i]).toString())
		}
	})
	return element('filter', {id},
		element("feColorMatrix", {type: 'matrix', values: '.375 .5 .125 0 0 .375 .5 .125 0 0 .375 .5 .125 0 0 0 0 0 1 0'}),
		element("feComponentTransfer", {"color-interpolation-filter": "sRGB"},
			element("feFuncR", {type: "table", tableValues: components[0].join(" ")}),
			element("feFuncG", {type: "table", tableValues: components[1].join(" ")}),
			element("feFuncB", {type: "table", tableValues: components[2].join(" ")})
		)
	)
}

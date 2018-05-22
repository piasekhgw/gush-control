class @Graph
  constructor: (canvas_id) ->
    @canvas = "##{canvas_id}"
    @digraph = new dagreD3.Digraph

  populate: (nodes, links) ->
    nodes.forEach (node) =>
      @digraph.addNode node.name,
        status: (node.status || 'None').toLowerCase()
        label: node.klass

    links.forEach (edge) =>
      @digraph.addEdge(null, edge.source, edge.target)

  render: ->
    renderer = new dagreD3.Renderer
    layout = dagreD3.layout().nodeSep(50).rankDir("LR");
    oldDrawNodes = renderer.drawNodes()

    renderer.drawNodes (graph, root) =>
      svgNodes = oldDrawNodes(graph, root);
      svgNodes.attr "data-job-name", (name) =>
        name;

      svgNodes.attr "class", (name) =>
        node = @digraph.node(name)
        classes = "node " + name.replace(/::/g, '_').toLowerCase()
        classes += " status-#{node.status}";
        classes;

      svgNodes;
    .layout(layout)
    .run(@digraph, d3.select("#{@canvas} g"));
    @panZoom()

  panZoom: ->
    svgPanZoom @canvas,
      panEnabled: true,
      minZoom: 0.8,
      maxZoom: 10,
      zoomEnabled: true,
      center: false,
      fit: true

  markNode: (name, class_names) ->
   name = name.replace(/::/g, '_').toLowerCase()
   $("svg#{@canvas} .node.#{name}")
     .attr('class', "node #{name} #{class_names}")

<template>
    <div id="treeview_container" class="hummingbird-treeview" style="height: 230px; overflow-y: scroll;">
        <ul id="treeview" class="hummingbird-base">
            <li>
                <i class="fa fa-plus"></i>
                <label>
                    <input id="xnode-0" data-id="custom-0" type="checkbox" /> node-0
                </label>
                <ul>
                    <li>
                        <i class="fa fa-plus"></i>
                        <label>
                            <input  id="xnode-0-1" data-id="custom-0-1" type="checkbox" /> node-0-1
                        </label>
                        <ul>
                            <li>
                                <label>
                                    <input class="hummingbird-end-node" id="xnode-0-1-1" data-id="custom-0-1-1" type="checkbox" /> node-0-1-1
                                </label>
                            </li>
                            <li>
                                <label>
                                    <input class="hummingbird-end-node" id="xnode-0-1-2" data-id="custom-0-1-2" type="checkbox" /> node-0-1-2
                                </label>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <i class="fa fa-plus"></i>
                        <label>
                            <input  id="xnode-0-2" data-id="custom-0-2" type="checkbox" /> node-0-2
                        </label>
                        <ul>
                            <li>
                                <label>
                                    <input class="hummingbird-end-node" id="xnode-0-2-1" data-id="custom-0-2-1" type="checkbox" /> node-0-2-1
                                </label>
                            </li>
                            <li>
                                <label>
                                    <input class="hummingbird-end-node" id="xnode-0-2-2" data-id="custom-0-2-2" type="checkbox" /> node-0-2-2
                                </label>
                            </li>
                        </ul>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
</template>

<script>
    export default {
        mounted() {
            $("#treeview").hummingbird();
        }
    }
</script>
